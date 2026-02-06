# Arquitetura de Redes com IoT 🛜

## Sumário
- [Conceitos e Histórico](#conceitos-e-histórico)
    - [O Que São Redes de Computadores](#o-que-são-redes-de-computadores)
- [Tipos de Redes e Comunicação](#tipos-de-redes-e-comunicação)
    - [Quantos Tipos de Redes Existem?](#quantos-tipos-de-redes-existem)
    - [Cabeadas vs. Sem Fio (Wireless)](#cabeadas-vs-sem-fio-wireless)
- [Componentes e Funções](#componentes-e-funções)
    - [Dispositivos de Rede](#dispositivos-de-rede)
    - [Outros Componentes e Funções](#outros-componentes-e-funções)
- [Modelos e Protocolos de Comunicação](#modelos-e-protocolos-de-comunicação)
    - [Modelos de Comunicação](#modelos-de-comunicação)
    - [Detalhes de Protocolo](#detalhes-de-protocolo)
- [Endereçamento e Infraestrutura](#endereçamento-e-infraestrutura)
    - [Endereçamento IP](#endereçamento-ip)
    - [Classes e Máscaras de Sub-Rede](#classes-e-máscaras-de-sub-rede)
    - [Cabeamento e Velocidade](#cabeamento-e-velocidade)
- [Topologias e Ferramentas](#topologias-e-ferramentas)
    - [Tipos de Topologias de Rede](#tipos-de-topologias-de-rede)
    - [Ferramentas de Diagnóstico e Configuração](#ferramentas-de-diagnóstico-e-configuração)

## Conceitos e Histórico

### O Que São Redes de Computadores?

**DEFINIÇÃO**
* São sistemas **interconectados de dispositivos** que **compartilham recursos e informações** por meio de **protocolos de comunicação**.
* Essas redes podem variar de tamanho e complexidade, desde **Redes Locais (LAN)** até **Redes Globais como a Internet**.

**APLICAÇÕES NO DIA A DIA:**
* Comunicação
* Educação
* Entretenimento
* Trabalho e Produtividade
* E-commerce e Bancos
* Saúde

**REDE EXPERIMENTAL**
* A criação das redes de internet surgiram durante a **Época da Guerra Fria** na década de 60, pois os EUA buscavam criar uma rede de comunicação **resistente a ataques nucleares**, que originou a rede experimental **ARPANET**.
* A Internet que conhecemos é uma **evolução da ARPANET** com a adição de **Protocolos de Comunicação**.

**ARPANET (RESUMO)**
* Significa em português: "**Rede da Agência de Pesquisas em Projetos Avançados**".
* Foi a **primeira rede de computadores** feita em **1969** para transmitir dados militares sigilosos e para interligar os departamentos de pesquisa por todos os Estados Unidos.
* **No contexto da Guerra Fria**.

**EVOLUÇÃO E TRÁFEGO**
* **Comunicação nos anos de 1970.** O **WWW (World Wide Web)** tornou a tecnologia acessível ao grande público no final dos anos 1980.
* A Internet é um esforço coletivo de vários cientistas e engenheiros. Estes são os principais nomes:
    * **Lawrence Roberts:** Cientista que liderou o desenvolvimento da ARPANET.
    * **J.C.R. Licklider:** Cientista da computação que criou o conceito da "Rede Galáctica".
    * **Tim Berners-Le:** Criador da World Wide Web.
* Em 1992, o tráfego de dados era de até **100GB por dia**, enquanto em 2013, já ultrapassava **28TB por segundo**.
* **Volume de Tráfego de Dados na Internet em 2024:** 68 Exabytes ou **24,92 Terabits por segundo**.

## Tipos de Redes e Comunicação

### Quantos Tipos de Redes Existem?

* **LAN:** Área Local (**Limitada a um edifício**).
* **WAN:** Longa Distância **(Segura e Confiável).** Provedores de serviços, empresas de telecomunicações, operadoras de dados, entre outros.
* **MAN:** Rede Metropolitana.
* **WLAN:** Rede Local Sem Fio.
* **WMAN:** Rede Metropolitana Sem Fio.
* **WWAN:** Longa Distância Sem Fio.
* **SAN:** Rede de Área de Armazenamento.
* **PAN:** Rede de Área Pessoal.

### Cabeadas vs. Sem Fio (Wireless)

**REDES CABEADAS (WIRED)**
* **Tecnologia, Velocidade, Confiabilidade.**
* **Instalação, Mobilidade.**
* Geralmente **melhores que as Wireless** em questão de **velocidade**.

**REDES SEM FIO (WIRELESS)**
* Garante **flexibilidade e mobilidade**.
* O 5G no Brasil demorou, pois utilizava a mesma frequência dos canais de TV.

**COMUTAÇÃO DE PACOTES**
* Um método de transmissão de dados em que as informações são divididas em **pacotes menores** e enviadas **independentemente** através de uma rede.

## Componentes e Funções

### Dispositivos de Rede

**HUB (O QUE É?)**
* Traduzido como **"Ponto Central"**, tem a função de **interligar computadores em uma rede local**.
* As redes interligadas por HUB costumam ser **lentas**, então **não é recomendado o uso simultâneo de mais de duas máquinas**.

**SWITCH**
* O SWITCH facilita o **compartilhamento de recursos** conectando todos os dispositivos, inclusive computadores, impressoras e servidores, na rede de uma empresa de pequeno porte.
* Enquanto um HUB conecta vários dispositivos Ethernet em um único segmento, o SWITCH permite **endereçar individualmente o tráfego** e permite dividi-lo em várias **VLANs**.
* **RESUMINDO:** HUBS e SWITCHES conectam computadores numa mesma LAN, mas os SWITCHES conseguem distinguir os computadores conectados a ele, e para qual deles uma informação deve ser encaminhada.
* **SWITCHES:** Gerenciáveis e Não Gerenciáveis.

**ROTEADOR**
* Ele funciona como um **distribuidor** direcionando o tráfego e escolhendo a rota mais eficiente para obter informações na forma de **pacotes de dados** e viajar pela rede.
* **"BURRO":** Pois ele emite sinal igualmente para todos os dispositivos ao redor em quantidade.
* **ROTEADOR:** É preciso para conectar dois SWITCHES, para que um reconheça o outro.

### Outros Componentes e Funções

* **DBA:** Data Base Administrator.
* **SERVIDOR DNS:** Domain Name Service.
* **DDoS:** Distributed Denial Of Service.
* **CTRL + F5:** Força o **reset do cache de um site**.
* **NÃO EXISTE AMBIENTE 100% SEGURO**.
* **SERVIDOR DHCP** -> **SERVIDOR DNS** -> **SERVIDOR WEB** (sequência de comunicação).
* **CERTIFICADO DIGITAL** - SHA-256.

## Modelos e Protocolos de Comunicação

### Modelos de Comunicação

**MODELOS DE COMUNICAÇÃO DE REDES: MODELOS OSI E TCP/IP**

* **OSI** - Open Systems Inter Connection (**7 Camadas**).
    * Qual modelo é mais adequado para explicar redes modernas? **OSI**.
* **TCP/IP** - Possui **4 Camadas**:
    1.  APLICAÇÃO
    2.  TRANSPORTE
    3.  REDE
    4.  ENLACE

**PRINCIPAIS PROTOCOLOS DE REDE**
* Os protocolos são importantes para a **interoperabilidade entre as fabricantes** (Seguir um Padrão).

**CAMADAS E PROTOCOLOS**
* **A APLICAÇÃO** define o protocolo (Ex: digitar **https://** no navegador - software do usuário).
* **O TRANSPORTE** define **TCP e UDP**.
* **A REDE** define o formato do **Internet Protocol (IP)** ou outro com IoT.
* **O ENLACE** define se é sinal **WiFi** ou **cabeado**.

### Detalhes de Protocolo

* **PROTOCOLOS DE ROTEAMENTO:**
    * **OSPF:** (Open Shortest Path First) Protocolo de Roteamento de **Estado de Link**.

* **PROTOCOLOS DE CAMADA DE TRANSPORTE:**
    * **TCP E UDP:** Enquanto um protocolo **garante que os dados foram devidamente recebidos** (**TCP**), o outro **não** (**UDP**).
    * Buscar termo "**Aperto de Mão**" em 4 fases no contexto **TCP**.

* **PROTOCOLOS DE CAMADA DE REDE/DIAGNÓSTICO:**
    * **ICMP:** **PROTOCOLO DE DIAGNÓSTICO**.
    * **ARP** e **IP**.

* **PROTOCOLOS DE CAMADA DE APLICAÇÃO:**
    * **TELNET:** **ABRE UMA JANELA DE CONVERSA COM A CONEXÃO**.
    * **FTP:** Mandar e receber arquivos no servidor para a máquina.
    * **SSH**, **HTTP**, **DNS**, **DHCP**.

* **PACOTE:** Fragmento de um dado a ser transmitido em rede, dividido em cada uma das camadas (na prática, 4).

## Endereçamento e Infraestrutura

### Endereçamento IP

**IP** (Internet Protocol)
* **Endereço único** para dispositivos que se conectam em uma rede baseada no protocolo.

**IP v4 (32 BITS)**
* **192.168.1.1** (32 bits, Decimal, dividido em 4 octetos e separados por **.**)
* **255.255.255.255** - **4 Blocos**.
* **IP DINÂMICO** - Servidor DHCP.
* **IP ESTÁTICO** - Configurado manual.
* **IP PÚBLICO x IP PRIVADO** (Exemplo: 186.223.47.32 x 192.168.6.213).
* Um computador possui **65536 portas**.
* O **MAC ADRESS** de um dispositivo é único.

**IP v6 (128 BITS)**
* **2001:D88:85A3::8A2E:370:7334** (128 bits, Hexadecimal, dividido por **:**)
* **8 Blocos**.
* **Decaimento de possibilidades:** 340 undecilhões.

### Classes e Máscaras de Sub-Rede

**FAIXAS IP**
* **CLASSE A:** 10.0.0.0 - 10.255.255.255. Máscara: **255.0.0.0**. **Grandes corporações.**
* **CLASSE B:** 172.16.0.0 - 172.31.255.255. Máscara: **255.255.0.0**. **Empresas de médio porte.**
* **CLASSE C:** 192.168.0.0 - 192.168.255.255. Máscara: **255.255.255.0**. **Pequenas redes domésticas ou corporativas.**

**MÁSCARA E HOSTS**
* **IP e Máscara de Sub-Rede:** IP: 10.0.X.1; MÁSCARA: 255.0.0.0.
* Apenas o **primeiro** bloco está em **255 na máscara**, isso implica que apenas o **10** representa a **REDE**, enquanto todos os restantes são os **HOSTS**.
* **253 máquinas** em uma rede Classe C.

### Cabeamento e Velocidade

**CABEAMENTO DE REDE**
* **Meio físico** utilizado para conectar dispositivos e permitir comunicação em LANs ou redes maiores.
* **Determina Velocidade e Confiabilidade**.
* Os **TWISTED PAIR** são trançados para evitar **interferência eletromagnéticas**.

**VELOCIDADE**
* **LARGURA DE BANDA (MHz):** Capacidade de transmitir sinais elétricos no cabo. Quanto **maior** a largura, **mais transmissão**.
* **VELOCIDADE MÁXIMA:** Taxa de transferência de dados que o cabo suporta. A largura de banda afeta a velocidade de máxima, mas **não de forma linear**.

**TIPOS DE CABOS**
* **CAT5E:** 100 MHz, 1 Gbps. Uso doméstico.
* **CAT6:** 250 MHz, 10 Gbps (55m). Redes de maior velocidade, curta.
* **CAT6A:** 500 MHz, 10 Gbps (100m).
* **CAT7 e CAT8:** Data centers e ambientes críticos.
* Para dispositivos **iguais** use o **CROSSOVER**, caso contrário, **par trançado**.

## Topologias e Ferramentas

### Tipos de Topologias de Rede

* Estrela
* Anel
* Mesh
* Barramento
* Árvore
* Híbrida
* Ponto a Ponto

**DESCRIÇÕES DE TOPOLOGIAS**
* **REDE EM ESTRELA:** O SWITCH se conecta em cada computador individualmente.
* **REDE EM ANEL:** Evita a **colisão de dados**.
* **REDE EM ÁRVORE:** É o **crescimento não programado** de uma estrela.
* **REDE DE MALHA (MESH):** **Tudo e todos conectado**.
* **REDE PONTO A PONTO:** Se um computador estiver desligado, os da frente **param de funcionar**.

### Ferramentas de Diagnóstico e Configuração

* **PROGRAMA:** Wireshark, tracert e Pingploter.
* **IPCONFIG /RENEW:** Solicita um novo IP.
* **IPCONFIG /RELEASE:** Libera o IP.
* **IPCONFIG /FLUSH DNS:** Limpa os nomes da tabela dos IPs.
* **NSLOOKUP:** Solicita o DNS para informação sobre o **domínio nome** e **endereços de IP**.
* **O CACHE:** É o arquivo temporário.

**Cisco Packet Tracer**
* *Diagrama mostrando conexões entre DHCP, WEB, ROUTER, FIREWALL, 1 VM e 2 VM C.*
