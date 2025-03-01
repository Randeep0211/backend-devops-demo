# Import Base Image from DockerHub
FROM node:23 AS development

# Work Directory
WORKDIR /app

# Copy Package.json and Package-lock.json
COPY package*.json ./

# Install node packages
RUN npm install

# Stage-2 

FROM node:23-alpine3.20

WORKDIR /app

# Copying the entire project

COPY . .

# Copy all the code & packages in the work directory of stage-2

COPY --from=development /app/node_modules ./node_modules

# Exposing PORT
EXPOSE 3001

# Entry point
ENTRYPOINT [ "npm"]

#CMD to run project. Check package-lock file for reference

CMD ["start"]