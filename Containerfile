# ____ ___ ____ _____ 
#|  _ \_ _/ ___|_   _|
#| |_) | | |     | |  
#|  __/| | |___  | |  
#|_|  |___\____| |_|  
#
FROM quay.io/apodhrad/pict:latest as pict

#  __  __       _       
# |  \/  | __ _(_)_ __  
# | |\/| |/ _` | | '_ \ 
# | |  | | (_| | | | | |
# |_|  |_|\__,_|_|_| |_|
#
FROM quay.io/apodhrad/tryit-editor:latest

COPY --from=pict / /

USER 1001

ENTRYPOINT ["tryit-editor"]

CMD ["start", "-c", "/var/tryit-editor/services.yaml"]
