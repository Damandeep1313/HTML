# Use a Debian-based Node.js 16 image (includes apt-get)
FROM node:16-bullseye

# Install zip via apt-get
RUN apt-get update && apt-get install -y zip

# Create and set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your source code into /app
COPY . .

# (OPTIONAL) If you want to copy a local .env file into the image 
# (Note: usually you don't want secrets baked into the image)
# COPY .env .env

# Expose the port your app listens on (3000)
EXPOSE 3000

# Define the command to start the server
CMD ["node", "server.js"]
