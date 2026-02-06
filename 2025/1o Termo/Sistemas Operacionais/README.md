# Sistemas Operacionais (SO) ⚙️

## Sumário
- [Tipos de Sistemas Operacionais](#tipos-de-sistemas-operacionais)
- [Arquitetura de Hardware e Processadores](#arquitetura-de-hardware-e-processadores)
    - [Arquitetura de Processadores e Bitagem](#arquitetura-de-processadores-e-bitagem)
- [Dispositivos de Armazenamento e Memória](#dispositivos-de-armazenamento-e-memória)
    - [Tipos de Armazenamento](#tipos-de-armazenamento)
    - [Memória e Cache](#memória-e-cache)
- [Padrões de Conexão (Interface)](#padrões-de-conexão-interface)
- [Sistemas de Arquivos (File Systems)](#sistemas-de-arquivos-file-systems)
    - [Tipos Conhecidos](#tipos-conhecidos)
- [Máquinas Virtuais (VM) e Cloud](#máquinas-virtuais-vm-e-cloud)
- [Divisão, Backup e Otimização](#divisão-backup-e-otimização)
    - [Unidades de Disquete (DOS)](#unidades-de-disquete-dos)
- [BIOS, CMOS e TPM](#bios-cmos-e-tpm)
- [Licenciamento e Distribuições](#licenciamento-e-distribuições)
- [Histórico e Pioneiros](#histórico-e-pioneiros)
- [Classificação de Porte (Computadores)](#classificação-de-porte-computadores)
- [Consumo de Energia e Eficiência](#consumo-de-energia-e-eficiência)

## Tipos de Sistemas Operacionais

* **SO DE PROPÓSITO GERAL**:
    * Compatível com diversos modelos de desktops e laptops.
    * Permite o usuário executar **múltiplas tarefas simultaneamente**.
* **SO MÓVEL**:
    * Atendem as necessidades de **dispositivos móveis** (smartphones e tablets).
    * São **menores e menos complexos**.
* **SO EMBARCADO**:
    * Feito para **fins específicos**, como em eletrodomésticos, aeronaves e linhas industriais.
* **SO DE REDE** (SO de Rede - sigla em inglês):
    * Facilita a **comunicação entre dispositivos em uma rede local**.
    * O conceito está sendo **menos usado**, mas é operado em dispositivos como **roteadores** e **firewall**.
* **SO DE TEMPO REAL**:
    * Deve operar **sem atrasos ou falhas de carregamentos**, pois deve **interagir com o mundo real de maneira constante e imediata**.
    * Usados em indústrias da **saúde, robótica, gás e petróleo**.

## Arquitetura de Hardware e Processadores

### Arquitetura de Processadores e Bitagem

A **arquitetura de SO** define o conjunto de **instruções que o computador é capaz de operar**.

* **iSOs (Sistemas Operacionais)**
    * **x86** ($\rightarrow$ **32 BITS**)
    * **x64** ($\rightarrow$ **64 BITS**)

| Arquitetura | SOs Compatíveis | Segmento |
| :--- | :--- | :--- |
| **ARM** | **x86 e x64** | **Reduced Instruction Set Computer** (RISC) - Arquitetura **mobile**, mais para **dispositivos móveis**. |
| **RISC** | **x86 e x64** | Usada por **servidores antigos** e **dispositivos por computador**. |
| **CISC** | **x86 e x64** | **Complex Instruction Set Computer** - Gama de processadores usada pela **Intel e AMD**. **Maior quantidade no mercado**. |

**Bitagem (8, 16, 32 e 64 bits):**

* **8 BITS** - **CMD, Windows 3.1**
* **16 BITS** - **Windows 98**
* **32 BITS** - **Windows ME, XP**
* **64 BITS** - **Windows 7** em diante

**Sinônimos:**

* **32 BITS** - **x86** (definido pela Intel)
* **64 BITS** - **x64** (definido pela AMD)

* O **sistema 64** suporta o de **32**, mas **não o contrário**.
* **O conceito de 32 bits e 64 bits podem ser utilizados tanto no sistema quanto nos softwares.**
* A arquitetura **x86** que é de **32 bits** está em **franca desaceleração, descontinuado**.
* O **Silício** é um **metal semicondutivo essencial** para a **construção dos processadores**.

## Dispositivos de Armazenamento e Memória

### Tipos de Armazenamento

* **STORAGE** - **Unidade de Armazenamento de Alta Capacidade**.
* **HD - DISCO RÍGIDO**
    * Armazenamento **Mecânico**, gravado magneticamente.
    * **Baixa velocidade** (**60 ~ 70 Mbps**).
* **SSD - SATA**
    * Armazenamento de **Média velocidade** (**550 ~ 670 Mbps**).
* **SSD - NVME**
    * Armazenamento de **Alta velocidade** (**3200 Mbps ~ 7600 Mbps**).
* **MICRO SD** - para **dispositivos móveis** e dividido por **classes**.

> **Diferenças: SSDs são mais rápidos e consomem menos energia.**

* **ADENSAMENTO DE INFORMAÇÕES** ($\rightarrow$ **dados**).
    * **Maior compactação**: **Micro SD, Micro Veloz**.
* **Evolução do Armazenamento**
    * **Veio de grandes dispositivos de armazenamento** em dimensões, mas com pouca capacidade, para dispositivos do tamanho de uma unha que cabe mais de **2.000 Gigas** (**Hoje em dia**).
    * A evolução para o futuro é o **cristal** com capacidade de até **3 Petabytes**.

### Memória e Cache

* A **arquitetura de SO** está diretamente ligada com o **processamento de multitarefa**, especificamente o **endereçamento** (alocar) **espaços específicos na memória** de um computador.
* O SO tabula toda essa memória, como em **Excel**, uma espécie de **coordenadas**.
* **MEMÓRIA ROM** (**Read Only Memory**): **Memória onde está gravado a BIOS**, **memória somente de leitura**.
* **CMOS**: **Chipset na placa-mãe** que tem **memória ROM**.
* **MEMÓRIA RAM**: **Realiza a conexão do processador com o storage** (memória de **acesso aleatório**).
* **CACHE**: **Memória de transferência**.
    * **1 MB** = **10.0 GB**.
    * Os dados eram **transferidos para o Cache** e **depois escritos no HD**. (Cache = **SRAM**)

## Padrões de Conexão (Interface)

* **Padrão PATA** (**Parallel Advanced Technology Attachment**):
    * **Padrão e conexão paralela**.
    * Um padrão para conectar dispositivos de armazenamento como **discos ópticos e rígidos à placa mãe**.
    * Foi o padrão mais popular por **40 anos**. É **Lento**.
* **Padrão SATA** (**Serial Advanced Technology Attachment**):
    * **Padrão de conexão serial**.
    * Uma **interface** para conectar **HDs, SSDs** e outros dispositivos de armazenamento à placa mãe. É a **evolução** do PATA.
* **Padrão NVMe** (**Non-Volatile Memory Express**):
    * Representa um **novo protocolo de transferência de dados** que é conectado **direto à placa mãe**. É o mais atual.

## Sistemas de Arquivos (File Systems)

* **SISTEMA DE ARQUIVOS**: **Todo o conjunto de arquivos e atributos são denominados METADADOS**.
    * **Funções**: **Nomear arquivos**, **Organizar os arquivos em pastas (diretórios)**, **Rastrear a localização dos dados** e **Gerenciar o espaço livre**.
* **Qual é o maior desafio para o sistema de arquivos?**
    * **O adensamento de dados** (a compactação).

### Tipos Conhecidos

* **FAT** (**File Allocation Table**)
    * **O FAT é um sistema de arquivos FECHADO (proprietário)**.
    * **FAT 32**: Para **pendrives e cartões de memória** por conta da **vastidão de compatibilidade**.
* **NTFS** (**New Technology File System**)
    * **Resolveu o problema do ExFAT** para **sistemas legados** (**Windows NT, Windows Vista** e **Windows 7**).
    * **Volume** de 256 TB. Permite 16 TB por arquivo. **Permanece evoluindo**.
* **ExFAT** (Extended File Allocation Table)
    * Veio antes do ExFAT.
* **EXT2, EXT3, EXT4** ($\rightarrow$ **LINUX**)
    * **Open Source** - um **sistema de arquivos aberto**.
    * **EXT4** **inova na adição do JOURNALING** e é **mais veloz** que o EXT3.
* **ReFS** (**Resilient File System**): Suporta até **16 Exabytes** de arquivos.
* **Apple - HFS e APFS**
    * **APFS** é **otimizada para SSDs**. **64 bits**, **criptografia**, **snapshots**, **clones** e **somas de verificação e compatibilidade**.
    * **HFS** era para **discos rígidos**. **32 bits**, com **limitações**.

> **Por que o NTFS é o mais difundido do mundo?**
> Por ser **Windows-compatível** e **constantemente melhor**.

## Máquinas Virtuais (VM) e Cloud

* **O QUE É VIRTUAL MACHINE?**
    * É um **sistema que emula todo um hardware** para a **instalação do SO** dentro de **outro SO**.
* **Todos os servidores de DATA CENTER possuem máquinas virtuais**. **Sem as VMs, a nuvem não existe**.
* A **VANTAGEM da VM é poder realizar testes** dentro deles e **estar protegido de vírus** caso não exista ponte para a **máquina real**.
* **Desvantagens de utilizar máquinas virtuais:**
    * **Se o PC real, onde as VMs estão configuradas, parar de funcionar, todas as VMs também param**.
* **VMWARE**: Utilizado no **âmbito profissional**, com **suporte técnico especializado**.
* **VIRTUAL BOX**: **Open Source, gratuito**. **Fácil de utilizar** com comunidade ativa para suporte.

## Divisão, Backup e Otimização

* **CAPACIDADE DE ARMAZENAMENTO**: O ideal para que o SO seja usado de forma integral (C:\) é **85-90%**.
* **O ato de dividir as unidades de armazenamento** para **melhor organização** ou **backup**, evitando a **perda de informações**.
    * **Quanto mais divisões de unidade, menor a taxa de transferência**.

### Unidades de Disquete (DOS)

* **A:\**: Unidade inicial para **inicializar o SO**.
* **B:\**: Unidade de **backup** (primeira) necessária.
* **C:\**: Unidade de **todo SO atual**, a mais importante. **Não é possível usar um SO sem se utilizar a C:\**.
* **D:\**: Unidade de **expansão** para armazenamento **ou backup**.
* **Backup**: Pode ser uma **unidade de referência alternativa**, como um **dado gravado caso o principal não esteja funcionando** (**Plano B**).
* **JOURNALING**, **SNAPSHOTS**, **COPY-ON-WRITE**, **COMPRESSÃO** e **CHECKSUM** são mecanismos de segurança e recuperação.
    * **Não se faz SNAPSHOT de um banco de dados, se faz BACKUP**.

## BIOS, CMOS e TPM

* **BIOS** (**Basic Input/Output System**):
    * **Sistema principal de inicialização do PC**.
    * **Verifica todos os periféricos** para entregar o **controle do SO**.
    * **Verifica se há BIOS instalada ao ligar (POWER)**.
* **CMOS** (**Complementary Metal-Oxide-Semiconductor**):
    * Chipset na placa-mãe que tem **memória ROM**. **Controla** periféricos de entrada e saída, **relógio** (time/stopwatch), etc.
* **TPM** (**Trusted Platform Module**):
    * **Dispositivo físico** que existe para **auxiliar o BIOS** na **segurança do SO** com uma **criptografia de alta densidade**.
* **ISO**: **Imagem grande padrão de instalação do SO** e **extensão de arquivo**.

## Licenciamento e Distribuições

* **A pirataria** incide diretamente sobre a **propriedade intelectual** do conteúdo do SO.
* **Tipos de Licença**: **AQUISIÇÃO PERPÉTUA**, **ALUGUEL** (**SaaS**), **SOFTWARE LIVRE** (**Open Source**), **FREEWARE** e **AUTOFINANCIAMENTO**.
* **LINUX**: **Mais de 1000 variações** (Distros) como **UBUNTU, DEBIAN, LINUX MINT, FEDORA, KALI LINUX**, etc.
    * O **LINUX** mais parecido com o **WINDOWS** é o **MINT**.
    * **Empresas podem comprar licenças especiais** para suas necessidades (Lucro do SO).
    * O não uso massivo do Linux é devido à **zona de conforto**, **estabilidade** e **ausência de suporte** (por ser grátis).

## Histórico e Pioneiros

| Figura / Tema | Contribuição |
| :--- | :--- |
| **WILLIAM OUGHTRED** | **Régua de Cálculo**. |
| **BLAISE PASCAL** | **Máquina de Pascal** (calculadora mecânica). |
| **GOTTFRIED LEIBNIZ** | **Calculadora Leibniz** (executava as 4 operações aritméticas). |
| **JOSEPH-MARIE JACQUARD** | **Tear Programável**. |
| **HERMAN HOLLERITH** | **Máquina de Hollerith** (máquina tabuladora para o censo de 1890). |
| **VANNEVAR BUSH** | **Arquitetura Binária** (em 1931). |
| **GM-NAA I/0** | **Primeiro SO** para o IBM 704 (anunciado em 21/05/1957). |
| **ENIAC** | **Primeiro computador eletrônico digital de propósito geral programável** (1946). |
| **IBM** | A **empresa mais antiga de computação do mundo**. |

* O **maior tropeço da IBM em SO** foi **ENTREGAR O SISTEMA PARA A BILL GATES**.
* **ENIAC**: **Sempre existiu o file systems** (sistemas de arquivo) mesmo fora da computação digital.

## Classificação de Porte (Computadores)

* **GRANDE PORTE** (**MAINFRAME**): Dedicado ao **processamento de um volume de informações**.
* **MÉDIO PORTE** (**MID-RANGE**): Para aqueles que **precisam de processamento mas não de um volume tão grande**.
* **PEQUENO PORTE** (**SERVIDORES**): Relativamente mais **baratos**.
* **UNIX** - Sistema operacional para **Mainframe** (**computadores de grande porte**).

> **O produto mais importante para uma empresa são suas informações e dados.**

## Consumo de Energia e Eficiência

* **VELOZ** $\rightarrow$ **Processamento de Imagem**.
* **Geralmente, mais frequência $\rightarrow$ consome mais energia**.
* **O DPS** (Dispositivo de Proteção contra Surtos) é feito para **não ser afetado pelos dispositivos**, "sacrificando-se" quando ocorre uma **descarga elétrica**.
