start-bitcoind:
	scripts/start_bitcoind.sh src/bisq/docs/autosetup-regtest-dao/blocknotify

stop-bitcoind:
	scripts/stop_bitcoind.sh

build:
	cd src/bisq && ./gradlew build

mainnet-seednode:
	src/bisq/bisq-seednode --baseCurrencyNetwork=BTC_MAINNET  --nodePort=5005 --appName=bisq-BTC_MAINNET_Seed_5005 --logLevel=info

seednode:
	src/bisq/bisq-seednode --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --useDevPrivilegeKeys=true --nodePort=2002 --appName=bisq-BTC_REGTEST_Seed_2002 --logLevel=debug

arbitrator:
	src/bisq/bisq-desktop --daoActivated=true --genesisBlockHeight=111 --genesisTxId=30af0050040befd8af25068cc697e418e09c2d8ebd8d411d2240591b9ec203cf --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --nodePort=9222 --appName=bisq-BTC_REGTEST_Arb_dao --useDevPrivilegeKeys=true --fullDaoNode=true --rpcUser=bisq --rpcPassword=password --rpcPort=18443 --rpcBlockNotificationPort=5122

alice:
	src/bisq/bisq-desktop --daoActivated=true --genesisBlockHeight=111 --genesisTxId=30af0050040befd8af25068cc697e418e09c2d8ebd8d411d2240591b9ec203cf --baseCurrencyNetwork=BTC_REGTEST --useDevPrivilegeKeys=true --useLocalhostForP2P=true --nodePort=7777 --appName=bisq-BTC_REGTEST_Alice_dao --fullDaoNode=true --rpcUser=bisq --rpcPassword=password --rpcPort=18443 --rpcBlockNotificationPort=5120

bob:
	src/bisq/bisq-desktop --daoActivated=true --genesisBlockHeight=111 --genesisTxId=30af0050040befd8af25068cc697e418e09c2d8ebd8d411d2240591b9ec203cf --baseCurrencyNetwork=BTC_REGTEST --useDevPrivilegeKeys=true --useLocalhostForP2P=true --nodePort=8888 --appName=bisq-BTC_REGTEST_Bob_dao --fullDaoNode=true --rpcUser=bisq --rpcPassword=password --rpcPort=18443 --rpcBlockNotificationPort=5121

mainnet:
	src/bisq/bisq-desktop --baseCurrencyNetwork=BTC_MAINNET --useLocalhostForP2P=false --useDevPrivilegeKeys=false --nodePort=6666 --appName=bisq-BTC_MAINNET_local --logLevel=debug

.PHONY: start-bitcoind stop-bitcoind build-desktop
