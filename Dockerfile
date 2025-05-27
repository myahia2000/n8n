# Use supported Node.js version 20 (LTS)
FROM node:20

# Set working directory inside the container
WORKDIR /usr/src/app

# Enable corepack and prepare pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Clone n8n repo (shallow clone for faster builds)
RUN git clone --depth 1 https://github.com/n8n-io/n8n.git .

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build the app
RUN pnpm build

# Expose n8n default port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
