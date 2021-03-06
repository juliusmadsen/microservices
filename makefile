# Microservices Project Make File
# author: umer mansoor

VIRTUALENV = $(shell which virtualenv)

clean: shutdown
	rm -fr microservices.egg-info
	rm -fr venv

venv:
	$(VIRTUALENV) venv

install: clean venv
	. venv/bin/activate; python2 setup.py install
	. venv/bin/activate; python2 setup.py develop

launch: venv shutdown
	. venv/bin/activate; python2  services/account.py &
	. venv/bin/activate; python2  services/stocks.py &
	. venv/bin/activate; python2  services/trader.py &
	#. venv/bin/activate; python2  services/movies.py &
	#. venv/bin/activate; python2  services/showtimes.py &
	#. venv/bin/activate; python2  services/bookings.py &
	#. venv/bin/activate; python2  services/user.py &

shutdown:
	#ps -ef | grep "services/movies.py" | grep -v grep | awk '{print $$2}' | xargs kill  
	#ps -ef | grep "services/showtimes.py" | grep -v grep | awk '{print $$2}' | xargs kill  
	#ps -ef | grep "services/bookings.py" | grep -v grep | awk '{print $$2}' | xargs kill  
	#ps -ef | grep "services/user.py" | grep -v grep | awk '{print $$2}' | xargs kill  

