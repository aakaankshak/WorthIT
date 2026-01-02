WORTHIT – IS THIS PRODUCT WORTH IT?

An AI-powered MVP application that helps users decide whether a product is worth buying by generating an AI-based verdict, confidence score, reasons, and warnings.

--------------------------------------------------
PROJECT OVERVIEW
--------------------------------------------------

WorthIT allows users to:
- Enter a product name or product link
- Receive an AI-generated evaluation
- View a YES / NO verdict
- See a confidence score
- Understand key reasons for the verdict
- View warnings or drawbacks
- Optionally compare two products

This project is intentionally built as a Minimum Viable Product (MVP) with a strong focus on clarity, clean architecture, and end-to-end AI integration.

--------------------------------------------------
TECH STACK
--------------------------------------------------

Frontend:
- Flutter (Web and Mobile ready)
- Material 3 UI
- Feature-first architecture

Backend:
- Cloudflare Workers
- Groq AI (llama-3.1-8b-instant model)
- Serverless deployment
- CORS enabled for Flutter Web

--------------------------------------------------
REPOSITORY STRUCTURE
--------------------------------------------------

WorthIT/
|
|-- worthIT-frontend/
|   |-- lib/
|   |-- pubspec.yaml
|   |-- android/
|   |-- web/
|   |-- ...
|
|-- worthIT-backend/
|   |-- index.js
|   |-- wrangler.toml
|   |-- ...
|
|-- README.txt

--------------------------------------------------
BACKEND API DETAILS
--------------------------------------------------

Endpoint:
POST /v1/evaluate

Request Body:
{
  "productName": "iPhone 14",
  "userContext": "optional"
}

Response:
{
  "product": "iPhone 14",
  "result": {
    "verdict": "YES",
    "confidence": 0.82,
    "reasons": [
      "Strong performance",
      "Good long-term support"
    ],
    "warnings": [
      "Higher price compared to alternatives"
    ]
  }
}

--------------------------------------------------
KEY FEATURES
--------------------------------------------------

- AI-generated product evaluation
- Confidence-based recommendations
- Clean loading-to-result user flow
- Product comparison mode
- Robust error handling
- Fully CORS-safe backend for web deployment

--------------------------------------------------
INTENTIONALLY NOT INCLUDED (MVP DECISIONS)
--------------------------------------------------

To keep the project lightweight and focused, the following were intentionally skipped:
- Authentication
- Database storage
- Analytics
- Caching
- Rate limiting

These can be added in future versions if required.

--------------------------------------------------
RUNNING THE PROJECT LOCALLY
--------------------------------------------------

Frontend:
1. Navigate to the worthIT-frontend folder
2. Run: flutter pub get
3. Run: flutter run

Backend:
1. Navigate to the worthIT-backend folder
2. Add GROQ_API_KEY as a Cloudflare secret
3. Run: wrangler deploy

--------------------------------------------------
PROJECT STATUS
--------------------------------------------------

- Backend deployed and functional
- Frontend fully integrated
- End-to-end AI flow working
- Demo-ready MVP

--------------------------------------------------
NOTES
--------------------------------------------------

- Built for educational and demonstration purposes
- Architecture prioritizes clarity over scale
- Easily extensible for future enhancements

--------------------------------------------------
AUTHOR
--------------------------------------------------

Built as a full-stack AI MVP using Flutter, Cloudflare Workers, and Groq AI.

--------------------------------------------------
