# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to the root directory
WORKDIR /usr/src/app

# Copy the entire content of the root directory, excluding node_modules
COPY . .

# Install dependencies for the root directory
RUN npm install

# Set the working directory for the sample app
WORKDIR /usr/src/app/sample-apps/sample-app-ts

# Install and build the sample-app-ts
RUN npm install && npm run build

# Return to the root directory
WORKDIR /usr/src/app

# Expose the port the root app will run on
EXPOSE 8000

# Set environment variable for production
ENV NODE_ENV=production

# Run the application using the root package.json command
CMD ["npm", "run", "facetec-browser-sdk"]
