## Projeto Insight

Consiste em uma api para fazer um crud de usuarios.

## Decisões de Projeto

- Definição de qual banco utilizar. O PostgreSQL foi escolhido pela praticidade e familiaridade mas também possui outras vantagens como alto desempenho, evita vazamentos de memória e uma alta segurança dos dados.
- Com a instância do PostgreSQL rodando, em um container na porta 5432. Não é necessário criar schemas no banco, pois o controle de versão do flyway irá criar as tabelas e constraints de acordo com as migrations.
- O projeto é criado utilizando o Spring Initializr. Nele podemos definir se utilizaremos Maven ou Gradle, além de definir fatores como nome do projeto, versão do JDK e outros. Foi escolhido o Maven para gerenciar o projeto e suas dependências.
- Ainda com o Spring Initializr, algumas bibliotecas foram escolhidas e adicionadas ao arquivo pom.xml. 
- Nesse ponto, é criado os models das diversas entidades que farão parte do sistema.
- Foi criado models das entidades e para cada model existe um Repository Controller.
- Cada Repository extende a classe JpaRepository que torna o acesso a banco muito mais simples pois torna a interface disponivel via injeção de dependência e com métodos pré prontos.
- A camada de Controller utiliza de mapeamentos do Spring para cada situação. Por exemplo, para obter a lista de usuários é utilizado o verbo GET e a anotação é a @GetMapping.

- Atual estado da aplicação:
- A aplicação não está completa ainda. Os endpoints estão funcionais mas as visões de cada usuário ainda está por ser feita. Ainda não está ideal e ela poderá ser melhorada com a utilização do Spring Security.
- Pode ser feito no momento requests que envolvam o CRUD de basicamente todas as entidades(Admin, Aluno, Coordenador, Curso, Cadeira, Professor e Semestre).
 

## Tecnologias/frameworks utilizados
Foram utilizadas tecnologias atuais de maneira que seja tirado proveito dos avanços alcançados pelo stack do Spring, principalmente do Spring Boot.

<b>Desenvolvido com</b>
- [JDK 1.8](https://docs.oracle.com/javase/8/docs/api/)
- [Spring Boot 2.1.3](http://spring.io/projects/spring-boot)
- [Spring MVC 2.1.3](http://spring.io/projects/spring-boot)
- [Spring JPA 2.1.9](http://spring.io/projects/spring-data-jpa)
- [PostgresSQL 12.0](https://www.postgresql.org/docs/12/release-12.html)
- [Docker 18.09.3](https://www.docker.com)
- [Docker Compose 1.17.1](https://www.docker.com)

## Instalação
1.  Navegar até a raiz do projeto e execute via linha de comando, o seguinte: <code>./gradlew build</code> para gerar o build da api
1. Instalar Docker e Docker Compose.
2. Fazer o fork do projeto e em seguida baixá-lo <code>git clone https://github.com/tarciso-torres/projeto-nati.git</code>
3. Navegar até a raiz do projeto e execute via linha de comando, o seguinte: <code>docker-compose up</code>. Isso fará com que o docker-compose criará um container para o postgreSQL e só depois que o banco estiver operacionavel ele subirá o container da aplicação.

## Exemplo do código

### Controller:
      
@RestController
@RequestMapping(value = "/user")
public class UserController {

    private UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/all")
    Iterable<User> all() {
        return userRepository.findAll();
    }
}

No exemplo acima, é criado um resource com um método de listar todos os usuários que graças a anotação <code>@GetMapping</code>, o método estará disponível via GET a /users.

### Repository:

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
}
É criada uma interface e fazemos ela estender a classe JpaRepository. Esse classe já traz diversos métodos prontos para serem utilizados.
