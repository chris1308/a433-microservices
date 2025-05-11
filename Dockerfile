# Base image
FROM node:18

# Set work directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Expose port 3001
EXPOSE 3001

# Start the app
CMD ["npm", "start"]