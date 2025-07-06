# 🗺️ amrajajabor_maps

A Flutter project that demonstrates map-based functionality with clean architecture and environment configuration support using `.env` files.

---

## 🚀 Getting Started

This project uses [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) to manage environment variables and supports different environments (dev, staging, prod) via build-time flavor injection.

### 📁 Environment Setup

Create your `.env` files at the root level:

```bash
.env            # default (used for dev)
.env.staging    # for staging
.env.prod       # for production
