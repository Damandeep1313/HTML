# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the entire application code
COPY . .

# Expose the port the server runs on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "llm.js"]
