# Integrating Gemini AI in CLI (Ubuntu Demo)

For demonstration purposes, we will use a virtual Ubuntu environment.

---

## 1. Navigate to Ubuntu Environment

https://killercoda.com/playgrounds/scenario/ubuntu

> Note: This environment is available for 1 hour only.

---

## 2. Update Package Information

```bash
sudo apt update
sudo apt upgrade -y
```

---

## 3. Install Node.js and npm

### Option 1:
```bash
sudo apt install npm
```

### Option 2 (Recommended - Node.js v20):
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

---

## 4. Verify Installation

```bash
node -v
npm -v
```

---

## 5. Install Gemini CLI

```bash
npm install -g @google/gemini-cli
```

---

## 6. Run Gemini CLI

```bash
gemini
```
<img width="1333" height="804" alt="image" src="https://github.com/user-attachments/assets/7942767d-c43f-464d-abf6-f68581579ec6" />
---

## 7. Setup Flow

- It will ask which folder to trust
<img width="1337" height="732" alt="image" src="https://github.com/user-attachments/assets/53d219ca-7432-4816-8e10-0207469db691" />

- Sign in with Google OR use Vertex AI / Google AI key  
<img width="1337" height="732" alt="image" src="https://github.com/user-attachments/assets/53d219ca-7432-4816-8e10-0207469db691" />

---

## 8. Authentication Steps

- CLI provides a URL  
- Open the URL in browser  
- Select your Google account  
- Copy the authorization code  

<img width="1338" height="273" alt="image" src="https://github.com/user-attachments/assets/a69e701a-6eaf-4e1d-9367-18b09cbee45c" />

---

## 9. Complete Login

- Paste the authorization code back into terminal  
 <img width="1338" height="273" alt="image" src="https://github.com/user-attachments/assets/a69e701a-6eaf-4e1d-9367-18b09cbee45c" />

---

## 10. Start Using Gemini

- Once configured successfully, you can enter prompts directly in the console  
  <img width="1338" height="849" alt="image" src="https://github.com/user-attachments/assets/b1789351-caad-4ed9-9ecd-caa35bf0b6db" />
---

## ⚠️ Common Error

```bash
gemini
SyntaxError: Invalid regular expression flags
```

### Cause:
Node.js version is less than 20  

### Fix:
```bash
node -v
```

If version is less than 20, reinstall Node.js:

```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

---

## ✅ Summary

- Open Ubuntu playground: https://killercoda.com/playgrounds/scenario/ubuntu  
- Install Node.js (v20 or higher)  
- Install Gemini CLI  
- Authenticate using Google  
- Start using Gemini in CLI  

