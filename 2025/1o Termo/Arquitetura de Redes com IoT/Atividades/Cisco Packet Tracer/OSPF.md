# Material complementar

Configuração do protocolo de roteamento para configurar o protocolo OSPF no router e fazer a comunicação entre as redes.

1o. veja quais redes estão ligadas no roteador 
2o. Clique no roteador e depois em CLI
3o. Faça os seguintes comandos

```
enable

configure terminal

router ospf 1

network <rede ligada ao roteador> <mascara invertida> area 0

network <rede ligado ao roteador> <mascara invertida> area 0

(caso tenha mais redes, repetir)

exit

exit

write memory
```

Como calcular a Máscara invertida
Ex. IP: 192.168.1.23 - 255.255.255.0
Calculo ---> 255.255.255.0  menos 255.255.255.255 --> 0.0.0.255

Ex. IP: 10.10.1.2 - 255.255.255.252
Calculo ---> 255.255.255.252  menos 255.255.255.255 --> 0.0.0.3