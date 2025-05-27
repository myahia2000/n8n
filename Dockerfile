# ✅ Use supported Node.js version (e.g., 20)
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Clone n8n and install dependencies
RUN git clone https://github.com/n8n-io/n8n.git . \
 && pnpm install

# Build the app
RUN pnpm build

# Expose port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
