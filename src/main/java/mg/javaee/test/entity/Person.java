package mg.javaee.test.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.Map;

@Entity
@Table(name = "person")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    private String description;

    private String contact;

    private String email;

    @Lob
    private Byte[] profil;

    @ElementCollection
    private List<String> skills;

    private String country;

    private String rate;

    private String field;

    private String address;

    private Double star;

    @ElementCollection
    @CollectionTable(name = "file_mapping", joinColumns = @JoinColumn(name = "container_id"))
    @MapKeyColumn(name = "file_name")
    @Lob
    @Column(name = "file_data", columnDefinition = "LONGBLOB")
    private Map<String,Byte[]> attachments;
}