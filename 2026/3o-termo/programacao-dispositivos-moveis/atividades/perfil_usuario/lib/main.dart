import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  final Color grayHeaderFooter = const Color(0xFF7A7571);
  final Color blueBackground = const Color(0xFF4274B5);
  final Color grayBackground = const Color(0xFFE5E5E5);
  final Color badgeBackground = const Color(0xFF8B9296);
  final Color lightBlueAttributes = const Color(0xFF7CA3F3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayBackground,
      // AppBar (Header)
      appBar: AppBar(
        backgroundColor: grayHeaderFooter,
        elevation: 0,
        leading: const Icon(Icons.settings, color: Colors.white, size: 28),
        title: const Text(
          'Perfil de Usuário',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // UserInfo (Container)
            _buildUserInfo(),

            const SizedBox(height: 20),

            // Badges (Row)
            _buildBadges(),

            const SizedBox(height: 20),

            // Social Media (Row)
            _buildSocialMedia(),

            const SizedBox(height: 20),

            // Attributes (Container)
            _buildAttributes(),
          ],
        ),
      ),
      // BottomNavBar (Footer)
      bottomNavigationBar: Container(
        height: 60,
        color: grayHeaderFooter,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            Icon(Icons.home, color: Colors.white, size: 36),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      color: blueBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          // Ícone de Share no topo esquerdo
          const Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.share, color: Colors.white),
          ),
          // ProfilePicture
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white24,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/474x/be/85/ed/be85ede6b4e1405356077194445313e1.jpg'), // Imagem de placeholder
          ),
          const SizedBox(height: 16),
          // TextContainer (Username + EditIcon)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Leonardo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.edit, color: Colors.white, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          // Bio
          const Text(
            'Buscando inspirações maiores na vida.\nFamília acima de tudo 🙏🤍.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildBadges() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Followers
          _badgeItem('Seguidores', '1,2k'),
          // Following
          _badgeItem('Seguindo', '308'),
          // UserSince
          _badgeItem('Desde', '2016'),
        ],
      ),
    );
  }

  Widget _badgeItem(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: badgeBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const[
        FaIcon(FontAwesomeIcons.facebook, color: Color.fromRGBO(43, 125, 218, 1), size: 48),        
        SizedBox(width: 12,),
        FaIcon(FontAwesomeIcons.instagram, color: Color.fromARGB(255, 226, 139, 226), size: 48),        
        SizedBox(width: 12,),
        FaIcon(FontAwesomeIcons.tiktok, color: Color.fromARGB(255, 0, 0, 0), size: 48),        
        SizedBox(width: 12,),
        FaIcon(FontAwesomeIcons.telegram, color: Color.fromARGB(255, 109, 152, 245), size: 48),        
        SizedBox(width: 12,),
        FaIcon(FontAwesomeIcons.reddit, color: Color.fromARGB(255, 212, 93, 14), size: 48),        
        SizedBox(width: 12,)
      ],
    );
  }

  Widget _buildAttributes() {
    return Container(
      color: lightBlueAttributes,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sobre Mim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.open_in_full, color: Colors.white),
            ],
          ),
          const SizedBox(height: 12),
          // Info Texts
          _attributeText(
            'Habilidades: ',
            'Design de Interface (UI/UX), Edição de Vídeo, Branding e Estratégia Digital.',
          ),
          const SizedBox(height: 6),
          _attributeText(
            'Localização: ',
            'Florianópolis, SC (Conhecida como a Ilha do Silício brasileira).',
          ),
          const SizedBox(height: 6),
          _attributeText(
            'Empresa: ',
            'Studio Nexus Creative ou Freelancer Autônomo.',
          ),
          const SizedBox(height: 6),
          _attributeText(
            'Ambições: ',
            'Liderança Criativa, Projetos Internacionais e Mentoria de Design.',
          ),
          const SizedBox(height: 6),
          _attributeText(
            'Interesses: ',
            'Fotografia, Viagens de Imersão e Mentorias Sociais.',
          ),
        ],
      ),
    );
  }

  Widget _attributeText(String boldLabel, String text) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.3),
        children: [
          TextSpan(
            text: boldLabel,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(text: text),
        ],
      ),
    );
  }
}