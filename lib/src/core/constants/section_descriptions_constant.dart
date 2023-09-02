import 'package:portfolio/src/models/section_descriptions/section_descriptions_model.dart';
import 'package:portfolio/src/models/section_descriptions/section_descriptions_technologies_model.dart';

final sectionDescriptionsContant = SectionDescriptionsModel(
  projects:
      'Abaixo encontrará uma seleção dos meus principais projetos, que construí usando as tecnologias que tenho conhecimento. Cada projeto aqui presente possuí imagens e vídeo como referencia, link de acesso ao código fonte (frontend, backend e/ou mobile) e demo (ou apk de instalação) caso esteja disponível, assim como uma lista das tecnologias usadas, bastando apenas apertar no card para ter acesso a essas informações.',
  socialNetworks:
      'Me acompanhe para manter-se atualizado sobre meu trabalho. Nas redes sociais compartilho dicas, projetos, notícias, novidades, dentre outros assuntos relacionados ao mundo da tecnologia. Vamos manter contato e compartilhar ideias!',
  technologies: sectionDescriptionsTechnologiesContant,
);

final sectionDescriptionsTechnologiesContant =
    SectionDescriptionsTechnologiesModel(
  description:
      'O mundo da programação é vasto, existindo inúmeras soluções para os mais diversos casos e é uma parte essencial do meu trabalho como programador Full Stack conhece-las. Logo abaixo, encontrará uma lista das tecnologias com as quais trabalho e que são fundamentais para os meus projetos, assim como as que atualmente estou estudando e as que tenho interesse em aprender.',
  knownTechnologies:
      'Ao longo dos meus estudos para me tornar um programador Full Stack, adquiri várias habilidades em diversas tecnologias que são essenciais para o desenvolvimento das minhas soluções, as quais seguem-se uma lista das que tenho conhecimento.',
  studyingTechnologies:
      'Minha jornada como programador Full Stack é uma busca constante por aprimoramento e atualização. Além das tecnologias que citei acima, estou dedicando tempo e esforço para estudar e aprofundar meus conhecimentos em outras tecnologias, que são as seguintes:',
  plannedTechnologies:
      'Assim como foi divertido estudar e atualmente estar usando várias tecnologias, estou ansioso para explorar novas possibilidades com outras linguagens, bibliotecas, frameworks e ferramentas. Algumas das quais planejo estudar no futuro incluem:',
  moreInfoText:
      'Caso queira saber mais a respeito da tecnologia, aperte na sua logo e será direcionado para uma tela com o seu nome, uma breve descrição, dia que foi lançada, quem a criou, empresas e projetos que a usam, link para o seu site oficial, repositório no GitHub e playground (se tiver), que é onde poderá testar a tecnologia (geralmente se restringe as linguagens de programação, embora exista opções de editores de código e IDEs online).',
);
