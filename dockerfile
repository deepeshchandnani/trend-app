
FROM nginx:alpine


RUN rm -rf /usr/share/nginx/html/*


COPY dist/ /usr/share/nginx/html/


EXPOSE 3000


COPY nginx.conf /etc/nginx/conf.d/default.conf

