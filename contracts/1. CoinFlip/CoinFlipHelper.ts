import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  for (let i = 0; i < 10; i++) {
    const tx = await attacker.hackContract();
    await tx.wait();
  }
};

export default helper;
