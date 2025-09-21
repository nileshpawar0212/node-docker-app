# Use Node LTS
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock first (for caching)
COPY package*.json ./

# Install only production dependencies (change if you need dev deps)
RUN npm install --production

# Copy app source
COPY . .

# Expose the runtime port
EXPOSE 3000

# Default command
CMD ["npm", "start"]

