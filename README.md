first fork project then clone then npm i to install dependency for running balance.js file.
Create your infura account & paste their your infura project id in below code line to run balance.js file.
const provider = new ethers.providers.JsonRpcProvider("https://polygon-mumbai.infura.io/v3/<YOUR_INFURA_PROJECT_URL>");

below paste your metamask address at ethereumAddress & ERC20 token contract address at tokenContractAddress
const tokenContractAddress = "0x902c"; // Address of the ERC20 token contract
const ethereumAddress = "0x300"; // Ethereum address or wallet address to check balance for

after completing above thing ensure you have install node. then node balance.js to eun that file.
