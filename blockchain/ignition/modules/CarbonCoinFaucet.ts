import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CarbonCoinFaucetModule = buildModule("CarbonCoinFaucet", (m) => {
  const carbonCoinFaucet = m.contract("CarbonCoinFaucet");
  return { carbonCoinFaucet };
});

export default CarbonCoinFaucetModule;