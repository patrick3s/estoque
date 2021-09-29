abstract class Serializer <T ,U>{
 U to(T data);
 T from(U data);
}