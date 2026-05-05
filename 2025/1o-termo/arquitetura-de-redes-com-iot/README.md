# Arquitetura de Redes com IoT

## Conceitos e Histórico

### O Que São Redes de Computadores?

#### Definição

- São sistemas **interconectados de dispositivos** que **compartilham recursos e informações** por meio de **protocolos de comunicação**.
- Essas redes podem variar de tamanho e complexidade, desde **Redes Locais (LAN)** até **Redes Globais como a Internet**.

**Aplicações no dia a dia:**

- Comunicação
- Educação
- Entretenimento
- Trabalho e Produtividade
- E-commerce e Bancos
- Saúde

#### Rede Experimental

- A criação das redes de internet surgiram durante a **Época da Guerra Fria** na década de 60, pois os EUA buscavam criar uma rede de comunicação **resistente a ataques nucleares**, que originou a rede experimental **ARPANET**.
- A Internet que conhecemos é uma **evolução da ARPANET** com a adição de **Protocolos de Comunicação**.

#### ARPANET (Resumo)

- Significa em português: "**Rede da Agência de Pesquisas em Projetos Avançados**".
- Foi a **primeira rede de computadores** feita em **1969** para transmitir dados militares sigilosos e para interligar os departamentos de pesquisa por todos os Estados Unidos.
- **No contexto da Guerra Fria**.

#### Evolução e Tráfego

- **Comunicação nos anos de 1970.** O **WWW (World Wide Web)** tornou a tecnologia acessível ao grande público no final dos anos 1980.
- A Internet é um esforço coletivo de vários cientistas e engenheiros. Estes são os principais nomes:
  - **Lawrence Roberts:** Cientista que liderou o desenvolvimento da ARPANET.
  - **J.C.R. Licklider:** Cientista da computação que criou o conceito da "Rede Galáctica".
  - **Tim Berners-Le:** Criador da World Wide Web.
- Em 1992, o tráfego de dados era de até **100GB por dia**, enquanto em 2013, já ultrapassava **28TB por segundo**.
- **Volume de Tráfego de Dados na Internet em 2024:** 68 Exabytes ou **24,92 Terabits por segundo**.

## Tipos de Redes e Comunicação

### Quantos Tipos de Redes Existem?

- **LAN:** Área Local (**Limitada a um edifício**).
- **WAN:** Longa Distância **(Segura e Confiável).** Provedores de serviços, empresas de telecomunicações, operadoras de dados, entre outros.
- **MAN:** Rede Metropolitana.
- **WLAN:** Rede Local Sem Fio.
- **WMAN:** Rede Metropolitana Sem Fio.
- **WWAN:** Longa Distância Sem Fio.
- **SAN:** Rede de Área de Armazenamento.
- **PAN:** Rede de Área Pessoal.

### Cabeadas vs. Sem Fio (Wireless)

#### Redes Cabeadas (Wired)

- **Tecnologia, Velocidade, Confiabilidade.**
- **Instalação, Mobilidade.**
- Geralmente **melhores que as Wireless** em questão de **velocidade**.

#### Redes Sem Fio (Wireless)

- Garante **flexibilidade e mobilidade**.
- O 5G no Brasil demorou, pois utilizava a mesma frequência dos canais de TV.

#### Comutação de Pacotes

- Um método de transmissão de dados em que as informações são divididas em **pacotes menores** e enviadas **independentemente** através de uma rede.

## Componentes e Funções

### Dispositivos de Rede

#### Hub (O que é?)**

- Traduzido como **"Ponto Central"**, tem a função de **interligar computadores em uma rede local**.
- As redes interligadas por Hub costumam ser **lentas**, então **não é recomendado o uso simultâneo de mais de duas máquinas**.

#### Switch

O switch facilita o **compartilhamento de recursos** conectando todos os dispositivos, inclusive computadores, impressoras e servidores, na rede de uma empresa de pequeno porte.

São separados entre gerenciáveis e não gerenciáveis, onde os primeiros permitem **configurações avançadas** e monitoramento do tráfego, enquanto os segundos são mais simples e fáceis de usar, mas sem recursos de gerenciamento.

##### Comparativo

Enquanto um Hub conecta vários dispositivos Ethernet em um único segmento, o switch permite **endereçar individualmente o tráfego** e permite dividi-lo em várias **VLANs**.

**Resumindo:** Hubs e Switches conectam computadores numa mesma LAN, mas os Switches conseguem distinguir os computadores conectados a ele, e para qual deles uma informação deve ser encaminhada.

#### Roteador

- Ele funciona como um **distribuidor** direcionando o tráfego e escolhendo a rota mais eficiente para obter informações na forma de **pacotes de dados** e viajar pela rede.
- **"Burro":** Pois ele emite sinal igualmente para todos os dispositivos ao redor em quantidade.
- **Roteador:** É preciso para conectar dois Switches, para que um reconheça o outro.

### Outros Componentes e Funções

- **DBA:** Data Base Administrator.
- **Servidor DNS:** Domain Name Service.
- **DDoS:** Distributed Denial Of Service.
- **Ctrl + F5:** Força o **reset do cache de um site**.
- **Não existe ambiente 100% seguro**.
- **Servidor DHCP** -> **Servidor DNS** -> **Servidor Web** (sequência de comunicação).
- **Certificado Digital** - SHA-256.

## Modelos e Protocolos de Comunicação

### Modelos de Comunicação

#### Modelos de Comunicação de Redes: Modelos OSI e TCP/IP**

- **OSI** - Open Systems Inter Connection (**7 Camadas**).
  - Qual modelo é mais adequado para explicar redes modernas? **OSI**.
- **TCP/IP** - Possui **4 Camadas**:
    1. Aplicação
    2. Transporte
    3. Rede
    4. Enlace

### Principais Protocolos de Rede

- Os protocolos são importantes para a **interoperabilidade entre as fabricantes** (Seguir um Padrão).

#### Camadas e Protocolos

- **A Aplicação** define o protocolo (Ex: digitar **https://** no navegador - software do usuário).
- **O Transporte** define **TCP e UDP**.
- **A Rede** define o formato do **Internet Protocol (IP)** ou outro com IoT.
- **O Enlace** define se é sinal **WiFi** ou **cabeado**.

### Detalhes de Protocolo

- **Protocolos de Roteamento:**
  - **OSPF:** (Open Shortest Path First) Protocolo de Roteamento de **Estado de Link**.

- **Protocolos de Camada de Transporte:**
  - **TCP e UDP:** Enquanto um protocolo **garante que os dados foram devidamente recebidos** (**TCP**), o outro **não** (**UDP**).
  - Buscar termo "**Aperto de Mão**" em 4 fases no contexto **TCP**.

- **Protocolos de Camada de Rede/Diagnóstico:**
  - **ICMP:** **Protocolo de Diagnóstico**.
  - **ARP** e **IP**.

- **Protocolos de Camada de Aplicação:**
  - **TELNET:** **Abre uma janela de conversa com a conexão**.
  - **FTP:** Mandar e receber arquivos no servidor para a máquina.
  - **SSH**, **HTTP**, **DNS**, **DHCP**.

- **Pacote:** Fragmento de um dado a ser transmitido em rede, dividido em cada uma das camadas (na prática, 4).

## Endereçamento e Infraestrutura

### Endereçamento IP

**IP** (Internet Protocol)

- **Endereço único** para dispositivos que se conectam em uma rede baseada no protocolo.

#### IP v4 (32 bits)

- **192.168.1.1** (32 bits, Decimal, dividido em 4 octetos e separados por **.**)
- **255.255.255.255** - **4 Blocos**.
- **IP Dinâmico** - Servidor DHCP.
- **IP Estático** - Configurado manual.
- **IP Público x IP Privado** (Exemplo: 186.223.47.32 x 192.168.6.213).
- Um computador possui **65536 portas**.
- O **MAC Address** de um dispositivo é único.

#### IP v6 (128 bits)

- **2001:D88:85A3::8A2E:370:7334** (128 bits, Hexadecimal, dividido por **:**)
- **8 Blocos**.
- **Decaimento de possibilidades:** 340 undecilhões.

### Classes e Máscaras de Sub-Rede

#### Faixas IP

- **Classe A:** 10.0.0.0 - 10.255.255.255. Máscara: **255.0.0.0**. **Grandes corporações.**
- **Classe B:** 172.16.0.0 - 172.31.255.255. Máscara: **255.255.0.0**. **Empresas de médio porte.**
- **Classe C:** 192.168.0.0 - 192.168.255.255. Máscara: **255.255.255.0**. **Pequenas redes domésticas ou corporativas.**

#### Máscara e Hosts

- **IP e Máscara de Sub-Rede:** IP: 10.0.X.1; Máscara: 255.0.0.0.
- Apenas o **primeiro** bloco está em **255 na máscara**, isso implica que apenas o **10** representa a **Rede**, enquanto todos os restantes são os **Hosts**.
- **253 máquinas** em uma rede Classe C.

### Cabeamento e Velocidade

#### Cabeamento de Rede

- **Meio físico** utilizado para conectar dispositivos e permitir comunicação em LANs ou redes maiores.
- **Determina Velocidade e Confiabilidade**.
- Os **Twisted Pair** são trançados para evitar **interferência eletromagnéticas**.

#### Velocidade

- **Largura de Banda (MHz):** Capacidade de transmitir sinais elétricos no cabo. Quanto **maior** a largura, **mais transmissão**.
- **Velocidade Máxima:** Taxa de transferência de dados que o cabo suporta. A largura de banda afeta a velocidade de máxima, mas **não de forma linear**.

#### Tipos de Cabos

- **CAT5E:** 100 MHz, 1 Gbps. Uso doméstico.
- **CAT6:** 250 MHz, 10 Gbps (55m). Redes de maior velocidade, curta.
- **CAT6A:** 500 MHz, 10 Gbps (100m).
- **CAT7 e CAT8:** Data centers e ambientes críticos.
- Para dispositivos **iguais** use o **Crossover**, caso contrário, **par trançado**.

## Topologias e Ferramentas

### Tipos de Topologias de Rede

- Estrela
- Anel
- Mesh
- Barramento
- Árvore
- Híbrida
- Ponto a Ponto

#### Descrições de Topologias

- **Rede em Estrela:** O Switch se conecta em cada computador individualmente.
- **Rede em Anel:** Evita a **colisão de dados**.
- **Rede em Árvore:** É o **crescimento não programado** de uma estrela.
- **Rede de Malha (Mesh):** **Tudo e todos conectado**.
- **Rede Ponto a Ponto:** Se um computador estiver desligado, os da frente **param de funcionar**.

### Ferramentas de Diagnóstico e Configuração

- **Programa:** Wireshark, tracert e Pingploter.
- **ipconfig /renew:** Solicita um novo IP.
- **ipconfig /release:** Libera o IP.
- **ipconfig /flushdns:** Limpa os nomes da tabela dos IPs.
- **nslookup:** Solicita o DNS para informação sobre o **domínio nome** e **endereços de IP**.
- **O Cache:** É o arquivo temporário.

#### Cisco Packet Tracer**

Software de simulação de rede desenvolvido pela Cisco Systems, utilizado para **ensinar e aprender sobre redes de computadores**. Ele permite que os usuários criem, configurem e testem redes virtuais em um ambiente simulado, facilitando o aprendizado prático de conceitos de rede sem a necessidade de hardware físico. O Packet Tracer é amplamente utilizado em cursos de certificação Cisco, como o CCNA, para ajudar os estudantes a entenderem a configuração e o funcionamento das redes.
