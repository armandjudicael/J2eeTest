package mg.javaee.test.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import java.sql.Blob;
import java.util.List;
import java.util.Map;

@Entity
@Table(name = "person")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @ElementCollection
    private List<String> skills;

    private String rate;

    private String field;

    private String address;


    @ElementCollection
    private Map<Byte[],String> piecejointes ;
}