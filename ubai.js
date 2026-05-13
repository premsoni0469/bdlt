import React, { useEffect, useState } from "react";
import Web3 from "web3";

export default function App() {
  const [account, setAccount] = useState("");
  const [contract, setContract] = useState(null);
  const [value, setValue] = useState("");
  const [stored, setStored] = useState("");

  const abi = [
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "x",
        "type": "uint256"
      }
    ],
    "name": "setData",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "data",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "getData",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
];

  const address = "0x3aE0A1d3fD55Ff230bD0971847Bf3f3ADcb46812"; // Ye bhi alag hoga, contract deploy karne k baad milta hai, console me

 useEffect(() => {
  async function init(){
    if(!window.ethereum){
      alert("Install metamsk");
      return;
    }
    const web = new Web3(window.ethereum);
    const acc = await window.ethereum.request({method: "eth_requestAccounts"});
    setAccount(acc[0]);

    const c = new web.eth.Contract(abi, address);
    setContract(c);

    const val = await c.methods.data().call();
    setStored(val);
  }
  init();
 },[]);

 const setData = async ()=>{
  await contract.methods.setData(value).send({from: account});
  const val = await contract.methods.data().call();
  setStored(val);
 }

  return (
    <div style={{ textAlign: "center", marginTop: 50 }}>
      <h2>Web3 App</h2>

      <p>{account}</p>

      <input onChange={(e) => setValue(e.target.value)} />

      <button onClick={setData}>Set</button>

      <h3>{stored}</h3>
    </div>
  );
}
