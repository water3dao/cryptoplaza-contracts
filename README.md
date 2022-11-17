# Cryptoplaza Contracts

Open source contracts for the CryptoPlaza


# Deploy and interact with Contracts

## Step 1. Setup Environment

install the nodejs dependencies

```
npm install
```

## Step 2. Setup Account

Create a file named .env, and copy the privatekey in the .env file. Please keep the .env file save.

## Step 3. Setup web3 provider

Register Infura account for free. e.g. https://infura.io/
update the host url in hardhat.config.js

### Step 4. Run the script 


By default is the goerli network. 

```
npm run goerli
```

### Step 5. The Logs will be showed as follows:

```
$ hardhat run --network goerli src/deploy.js
Loaded network  goerli 
Loaded account ----
Deployment TxHash: 0x-------
Deployment Address: 0x----
✨  Done in 12.36s.
```
