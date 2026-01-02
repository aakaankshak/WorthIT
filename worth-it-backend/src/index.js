export default {
  async fetch(req, env) {
    const url = new URL(req.url);
      if (url.pathname !== "/v1/evaluate") {
        return new Response("Not Found", { status: 404 });
      }

    try {
      if (req.method !== "POST") {
        return new Response("Only POST allowed", { status: 405 });
      }

      const body = await req.json();
      const { productName, userContext } = body;

      if (!productName) {
        return new Response(
          JSON.stringify({ error: "productName is required" }),
          { status: 400 }
        );
      }

      const prompt = `
      You are a product evaluation assistant.

      Analyze whether the product is worth buying.

      Product: ${productName}
      Context: ${userContext || "General consumer"}

      Respond ONLY in valid JSON with this exact structure:
      {
        "verdict": "YES or NO",
        "confidence": number between 0 and 1,
        "reasons": [string, string, string],
        "warnings": [string]
      }
      `;

      const groqRes = await fetch(
        "https://api.groq.com/openai/v1/chat/completions",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${env.GROQ_API_KEY}`
          },
          body: JSON.stringify({
            model: "llama-3.1-8b-instant",
            messages: [
              { role: "system", content: "You are a helpful assistant." },
              { role: "user", content: prompt }
            ],
            temperature: 0.3
          })
        }
      );

      const data = await groqRes.json();

      const raw =
        data?.choices?.[0]?.message?.content ??
        data?.choices?.[0]?.delta?.content ??
        "";

      let parsed;
      try {
        parsed = JSON.parse(raw);
      } catch {
        parsed = { raw };
      }

      return new Response(
        JSON.stringify({
          product: productName,
          result: parsed
        }),
        { headers: { "Content-Type": "application/json" } }
      );

      
    } catch (err) {
      return new Response(
        JSON.stringify({ error: err.message }),
        { status: 500 }
      );
    }
  }
};
