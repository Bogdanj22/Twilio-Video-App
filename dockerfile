# Step 1: Use a lightweight Node.js image with Alpine
FROM node:16-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json first to install dependencies
COPY package.json package-lock.json ./

# Step 4: Install npm dependencies
RUN npm install

# Step 5: Copy the rest of the application files, including the 'scripts' directory, into the container
COPY . .

# Step 6: Run the build process (using your custom build.js script)
RUN npm run build

# Step 7: Install the 'serve' package globally to serve the built app
RUN npm install -g serve

# Step 8: Expose port 3000 for the React app
EXPOSE 3000

# Step 9: Use 'serve' to serve the production build
CMD ["serve", "-s", "build", "-l", "3000", "--single"]
