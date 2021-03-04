FROM postgres
# Should go without saying never use ENV variables here in production
ENV POSTGRES_USER=jack
ENV POSTGRES_PASSWORD=pg1234
EXPOSE 5432
