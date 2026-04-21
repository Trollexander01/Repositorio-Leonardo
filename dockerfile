# Usamos Tomcat 10 que es compatible con la mayoría de funciones de JSP modernas
FROM tomcat:10.1-jdk17

# 1. Borramos lo que trae Tomcat por defecto (la carpeta ROOT original)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# 2. Creamos una carpeta ROOT vacía para que sea nuestra aplicación principal
RUN mkdir /usr/local/tomcat/webapps/ROOT

# 3. Copiamos TODO el contenido de tu repositorio dentro de esa carpeta ROOT
# Esto incluye tus carpetas "unidad 2", "unidad 3", etc.
COPY . /usr/local/tomcat/webapps/ROOT/

# Exponemos el puerto estándar
EXPOSE 8080

CMD ["catalina.sh", "run"]