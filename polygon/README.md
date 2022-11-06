### Core functions
```bash
    #save scores
    function uploadScore(
        int16 _score,
        string _description,
        address _beneficiary,
        uint256 _amount
    ) requiresFee(_amount) returns (bool b)

    # query scores
    function getScore(address _wallet) 
        returns (User[]) # returns a vector of Structs
```
___

### Solidity env set up
```bash
npm install --save-dev "hardhat@^2.12.0"
npm install @openzeppelin/contracts
```

### Test & compile
With Brownie
```bash
pip install eth-brownie
```

### Deploy
```bash
brownie run deploy.py --network polygon-test
```


### Interact
```bash
# import accounts
brownie accounts list
brownie accounts new josi  # enter josi's private key and a password
brownie accounts list


# connect to blockchain
brownie console --network polygon-test                                
    network.is_connected()                                             
    network.show_active()                                              


# interact with contract
    sc = StoreScores.at('yourcontractaddress')                        
    nene = accounts.load('nene')                                      
    josi = accounts.load('josi')                                     
    sc.userCount()                                                   
    sc.uploadScore(501, 'Yo!', nene, 3, {'from':josi, 'value': 3}) 
    sc.getScore(josi, {'from': josi})                                  
    ```
> `nene` and `josi` are an alias