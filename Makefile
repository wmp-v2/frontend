docker-build:
	git pull
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 471451201019.dkr.ecr.us-east-1.amazonaws.com
	docker build -t 471451201019.dkr.ecr.us-east-1.amazonaws.com/frontend:${image_tag} .
	docker push 471451201019.dkr.ecr.us-east-1.amazonaws.com/frontend:${image_tag}


eks-deploy:
	aws eks update-kubeconfig --name dev
	helm upgrade -i frontend helm -f helm/values/frontend.yml --set image_tag=${image_tag}
