# KAndy Helm Charts

## Add the repository to your helm
```shell script
helm repo add kandy 'https://raw.githubusercontent.com/kandy/helm/master/'
helm repo update
helm repo list
```
{% for el in site %}
  <p>{{ el }}</p>
{% endfor %}
