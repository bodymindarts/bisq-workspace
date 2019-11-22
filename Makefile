start-bitcoind:
	scripts/start_bitcoind.sh src/bisq/docs/autosetup-regtest-dao/blocknotify

stop-bitcoind:
	scripts/stop_bitcoind.sh

build:
	cd src/bisq && ./gradlew build

daemon:
	src/bisq/bisq-daemon --appName=Bisq-throwaway --daoActivated=false

mainnet-seednode:
	src/bisq/bisq-seednode --baseCurrencyNetwork=BTC_MAINNET  --nodePort=5005 --appName=bisq-BTC_MAINNET_Seed_5005 --logLevel=info

seednode2:
	src/bisq/bisq-seednode --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --useDevPrivilegeKeys=true --nodePort=3002 --appName=bisq-BTC_REGTEST_Seed_3002
seednode:
	src/bisq/bisq-seednode --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --useDevPrivilegeKeys=true --nodePort=2002 --appName=bisq-BTC_REGTEST_Seed_2002 --logLevel=debug

arbitrator:
	src/bisq/bisq-desktop --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --useDevPrivilegeKeys=true --nodePort=4444 --appName=bisq-BTC_REGTEST_arbitrator --logLevel=debug

alice:
	src/bisq/bisq-desktop --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --useDevPrivilegeKeys=true --nodePort=5555 --appName=bisq-BTC_REGTEST_Alice --logLevel=debug

bob:
	src/bisq/bisq-desktop --baseCurrencyNetwork=BTC_REGTEST --useLocalhostForP2P=true --useDevPrivilegeKeys=true --nodePort=6666 --appName=bisq-BTC_REGTEST_Bob --logLevel=debug

mainnet:
	src/bisq/bisq-desktop --baseCurrencyNetwork=BTC_MAINNET --useLocalhostForP2P=false --useDevPrivilegeKeys=false --nodePort=6666 --appName=bisq-BTC_MAINNET_local --logLevel=debug

.PHONY: start-bitcoind stop-bitcoind build-desktop
