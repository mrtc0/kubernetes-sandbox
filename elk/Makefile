.PHONY apply fluentd

apply:
	kubectl apply -Rf elasticsearch/
	kubectl apply -Rf kibana/
	kubectl apply -Rf fluentd/

fluentd:
	kubectl apply -Rf fluentd/
