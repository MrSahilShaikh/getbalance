
const { ethers } = require("ethers");

async function getTokenBalance(tokenContractAddress, ethereumAddress) {
    // Connect to Matic network through Infura
    const provider = new ethers.providers.JsonRpcProvider("https://polygon-mumbai.infura.io/v3/<YOUR_INFURA_PROJECT_URL>");

    // Create an instance of the ERC20 token contract
    const tokenContract = new ethers.Contract(tokenContractAddress, ['function balanceOf(address) view returns (uint256)'], provider);

    // Call the balanceOf function of the token contract to retrieve the balance
    const balance = await tokenContract.balanceOf(ethereumAddress);

    return balance;
}


const tokenContractAddress = "0x902c"; // Address of the ERC20 token contract
const ethereumAddress = "0x300"; // Ethereum address or wallet address to check balance for

getTokenBalance(tokenContractAddress, ethereumAddress)
    .then(balance => {
        console.log(`Token balance for ${ethereumAddress}: is ${ethers.utils.formatEther(balance)}`);
    })
    .catch(error => {
        console.error("Error:", error);
    });
