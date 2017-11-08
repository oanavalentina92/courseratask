all:
	@touch README.md
	@echo " # Peer-graded Assignment: Guessing Game" > README.md
	@echo -n "Generation date : " >> README.md
	@date >> README.md
	@echo -n "Number of lines : " >> README.md
	@wc -l < guessinggame.sh >> README.md
