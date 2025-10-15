#import "../../../../../template/definitions.typ": *

==== Entity <springboot_entity>

```kotlin
@Entity(name = "entityName")
@Table(name = "entityName")
class Entity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  val id: Long? = null,
  // ...
}
```
===== `@Entity` Annotation
Um eine Entity zu erstellen, muss eine Klasse mit `@Entity` annotated werden.
Bei der `@Entity` Annotation kann ein Name angegeben werden. 
Dieser Name wird verwendet, wenn in Queries Zugriff auf die Entity vorkommt. 
Wenn kein Name vorhanden ist, wird der Klassenname verwendet. \
@springJpaEntites

```kotlin
@Entity(name = "student")
```

===== `@Table` Annotation
Dazu kann noch eine `@Table` Annotation angebracht werden. 
Wenn keine vorhanden ist, wird eine Tabelle mit dem Namen der Entity in der Datenbank erstellt. 
Mit der `@Table` Annotation kann ein eigener Name dafür festgelegt werden. 
Außerdem kann auch ein Schema Name angegeben werden.
@springJpaEntites

```kotlin
@Table(name="STUDENT", schema="SCHOOL")
```

====== `@Id` Annotation
Jede Entity muss einen Primary Key besitzen. 
Wenn ein Datenfeld mit `@Id` annotated wurde, ist es der Primary Key. 
Die Id wird automatisch generiert. 
Wie diese Generation geschieht kann über `@GeneratedValue` festgelegt werden. Folgende Optionen stehen zur verfügung:
- AUTO
- TABLE
- SEQUENCE
- IDENTITY
Wenn AUTO genutzt wird, wird automatisch entschieden, welche der Strategien gerade genutzt werden soll. \
@springJpaEntites

#notice[Id einer Entity muss als *null* definiert sein][
  Eine Id muss nullable sein und als default Wert null besitzen. 
  Wenn das nicht der Fall ist, wird Spring beim Erstellen einer neuen Entity einen Error werfen. 
  Grund hierfür ist, dass eine definierte Id Spring davon ausgehen lässt, dass es diesen Eitrag bereits in der Datenbank gibt. 
  Wenn die Id null ist, weiß Spring, dass es sich hier um einen neuen Eintrag handelt.
]

```kotlin
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  val id: Long? = null
```

===== `@Column` Annotation
Datenfelder in einer Entity können mit der `@Column` genauer beschrieben werden. 
Folgende Informationen können über diese Annotation angegeben werden:
- name: Der Name des Columns in der Datenbank.
- length: Die maximale Länge des Datenfeldes. Zum Beispiel wäre das bei einem String die Anzahl der Zeichen.
- nullable: Definiert, ob das Datenfeld null sein darf oder immer einen Wert besitzen muss.
- unique: Definiert, ob dieses Datenfeld ein unique Key sein soll.
@springJpaEntites

===== Referenzen auf andere Tables
Oft muss eine Entity Referenzen auf andere Entities benutzen. 
So zum Beispiel, wenn es User und Rollen Entities gibt. 
Je nachdem, wie die Implementation geschehen muss, könnten hier `@OneToMany` oder `@ManyToMany` Relationen genutzt werden. \

`@OneToMany` würde zum Einsatz kommen, wenn ein User nur eine Rolle haben kann, aber eine Rolle auf mehrere User zugeordnet sein kann. \

`@ManyToMany` würde zum Einsatz kommen, wenn ein User mehrere Rollen haben kann und eine Rolle auch mehrere User besitzen kann.

====== `@OneToMany` und `@ManyToOne`
Es wird dem oben genannten Beispiel gefolgt. Ein User besitzt eine Role und eine Role hat mehrere User zugewiesen. 
Der User ist in diesem Fall das Child und die Role ist der Parent.
Das Child ist dabei der Besitzer der Relation.  
Dafür besitzt Role eine Id als Primary Key, die als `role_id` in Form eines Foreign Key im User Table gespeichert wird. \

Da Role mehrere User besitzen kann, wird hier eine Liste erstellt, die mit Objekten vom Typ User befüllt werden kann. 
Außerdem wird die `@OneToMany` Annotation hier angebracht, mit der Information, dass die Variable `"role"` in der User Klasse genutzt wird, um auf die Role, also die eigene Instanz, zu verweisen. 
Das `mappedBy` Attribut weist außerdem auf die Tatsache hin, dass hier keine Verwaltung von Foreign Keys stattfinden wird. 
Neben `mappedBy` kommt auch `cascade` und `orphanRemoval` oft vor. 
Mit dem `cascade` können Operationen angegeben werden, die auch alle Childobjekte betreffen sollen. 
Werden hier keine Informationen angegeben, werden zum Beispiel Childobjekte nicht gelöscht, wenn das Parent Objekt gelöscht wird. 
Foreign Keys werden auch erhalten, was zu Problemen führen kann. \

`orphanRemoval` kann auch genutzt werden, damit Child Objekte automatisch gelöscht werden, wenn sie von ihrem Parent Objekt getrennt werden. \

In der User Klasse muss nun die `role` Variable vorhanden sein. 
Durch das Hinzufügen von `@ManyToOne` wird eine bidirektionale Relation erschaffen. So können wir auch in der User Klasse alle Daten über Role erhalten. \ 

Außerdem ist die `@JoinColumn` Annotation vorhanden. 
Sie sollte typischerweise auf der Seite der Relation vorhanden sein, die die Relation besitzt. \

In den meisten Fällen ist es die Seite mit der `@ManyToOne` Annotation. 
Die Angabe eines `referencedColumnName` ist nicht zwingend notwending aber empfohlen. 
Wenn sie nicht vorhanden ist, wird automatisch nach dem primary Key in der Entity gesucht. 

```kotlin
@Entity(name = "user")
@Table(name = "user")
class User (

  @ManyToOne
  @JsonBackReference
  @JoinColumn(name = "role_id", referencedColumnName = "id")
  var role: Role? = null

)
```

```kotlin
@Entity(name = "role")
@Table(name = "role")
class Role(

  @OneToMany(
    mappedBy = "role"
  )
  var users: List<User> = emptyList()

)
```
@springHibernateOneToMany
@mediumSpringOneToMany

====== `@OneToOne`
Die `@OneToOne` Annotation wird genutzt, wenn eine Entity nur eine Instanz einer Anderen enthält. 
Es wird dabei wieder `@JoinColumn` verwendet, allerdings nur bei der besitzenden Seite der Relation. 
Die andere Seite benötigt nur `@OneToOne` mit dem `mappedBy` Attribut.
@springOneToOne

```kotlin
class User (
  @OneToOne
  @JsonBackReference
  @JoinColumn(name = "address_id", referencedColumnName = "id")
  var address: Address? = null
)
```

```kotlin
class Address (
  @OneToOne(mappedBy = "address")
  var user: User? = null
)
```

====== `@ManyToMany`
*TODO* @springManyToMany \
Einfache Implementation von `@ManyToMany`:
```kotlin
class Student (
  @ManyToMany
  val courses: List<Course>
)

class Course (
  @ManyToMany
  val students: List<Students>
)
```
