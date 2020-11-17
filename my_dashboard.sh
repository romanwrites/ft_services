#!/bin/bash

while :
do
	kubectl get pods > z
	echo -e "\n" >> z
	kubectl get svc >> z
	echo -e "\n" >> z
	kubectl get deployments >> z
	sleep 1
	clear
	cat z
done
