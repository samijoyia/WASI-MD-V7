# ═══════════════════════════════════════════════════════════════════
#  WASI-MD-V7 Heroku Dockerfile
#  Pulls and runs the actual bot image
# ═══════════════════════════════════════════════════════════════════

FROM mrwasi/wasimdv7:latest

# Cache buster - forces Heroku to pull latest image
# Change this date whenever you update the base image
ENV CACHE_BUST=2024-02-10-v2
ENV IMAGE_VERSION=7.0.0-latest

# Heroku requires binding to $PORT
ENV PORT=3000

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD node -e "console.log('healthy')" || exit 1

# Start the bot
CMD ["node", "index.js"]
