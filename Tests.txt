const { expect } = require("chai");
const { ethers } = require("hardhat");


describe("Presale", function () {
   
  let ps,tt,testToken;
  let presale;
  let owner, addr1, addr2, addr3, addrs;
  
  beforeEach(async()=>{
    try {

      tt = await ethers.getContractFactory("ERC20Token1");
      testToken = await tt.deploy("TestTok","TT");
      await testToken.deployed();

      // console.log("testToken address is :",testToken.address) // testToken address
 

 


      ps = await ethers.getContractFactory("Presale");
      presale = await ps.deploy(testToken.address);
      await presale.deployed();
   

    // console.log("Presale Address is :",presale.address) // presale address 

    ;[owner, addr1, addr2, addr3, ...addrs] = await ethers.getSigners()
 

    } catch (error) {
      console.error(error)
    }
      
    })
  
    it.only("Should return the Balance", async function () {


      let minted= await testToken._minting(ethers.utils.parseEther("1000"))
      let y=await testToken.balanceOf(owner.address)
        console.log("Minted tokens = ",y.toString() )

        let approvetokens= await testToken.approve(presale.address,ethers.utils.parseEther("100"))

        let allowanceCheck=await testToken.allowance(owner.address,presale.address)
        
        console.log("AllowanceCheck tokens = ",allowanceCheck.toString() )




        let buyErcToken= await presale.connect(addr1).buyErcToken({value:ethers.utils.parseEther('1')});

        let balOfAddr1= await testToken.balanceOf(addr1.address )

         expect (balOfAddr1).to.equal(ethers.utils.parseEther("10"))
        
      
        console.log("Minted tokens Remaining  balOfAddr1 = ",balOfAddr1.toString())




 
    });
 
 
  });
  