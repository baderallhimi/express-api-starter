# Express API Starter

A clean and scalable starter template for building RESTful APIs using Node.js and Express.  
This project provides a simple, well‑structured foundation suitable for SaaS products, backend services, and AI‑powered applications.

## Features
- Clean and easy‑to‑understand project structure
- Single entry point via server.js
- Organized routes inside the src directory
- Ready for integration with databases (MongoDB, PostgreSQL, etc.)
- Easy integration with AI models such as Claude or Groq
- Ideal for small and medium SaaS projects

## Project Structure
express-api-starter/
│
├── src/              (Route handlers and logic)
├── server.js         (Main server entry point)
├── package.json      (Project configuration and dependencies)
├── .env              (Environment variables)
└── node_modules/     (Installed packages)

## Getting Started
1) Install dependencies:
npm install

2) Start the server:
npm start

Default server URL:
http://localhost:3000

## Adding a New Route
Example route inside src/example.js:

const express = require("express");
const router = express.Router();

router.get("/hello", (req, res) => {
  res.json({ message: "Hello from Express API Starter!" });
});

module.exports = router;

Register the route inside server.js:

const exampleRoute = require("./src/example");
app.use("/api", exampleRoute);

## Claude API Integration Example
// Add your Claude API key inside the .env file

const fetch = require("node-fetch");

router.post("/claude", async (req, res) => {
  const response = await fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: {
      "x-api-key": process.env.CLAUDE_API_KEY,
      "content-type": "application/json"
    },
    body: JSON.stringify({
      model: "claude-3-sonnet",
      max_tokens: 200,
      messages: [{ role: "user", content: req.body.prompt }]
    })
  });

  const data = await response.json();
  res.json(data);
});

## Claude Integration (New)
This project includes a ready‑to‑use Claude API integration inside:

src/claude-example.js

Developers can send prompts to Claude using a simple POST request:

POST /api/claude
{
  "prompt": "Hello Claude!"
}

The Claude route is fully implemented and demonstrates how to integrate AI models into Express APIs.  
This makes the project useful for developers who want to build AI‑powered SaaS tools using Claude.

## Why This Project Fits Claude OSS
- Fully open‑source
- Real working backend code
- Clean structure and easy to extend
- Demonstrates practical API usage
- Ready for Claude integration
- Suitable for building real SaaS tools powered by Claude

## License
MIT License  
Fully open‑source.
