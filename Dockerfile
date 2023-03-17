# Use an official Node.js runtime as a parent image
FROM mcr.microsoft.com/playwright:v1.31.0-focal

# Set the working directory to /pw-test
WORKDIR /pw-test

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

RUN npx playwright install chromium

# Copy test files to the container
COPY . .

# Run the tests using Playwright
CMD ["npx", "playwright", "test"]
