# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Modernwarfare2
ENV MSSQL_RPC_PORT=135
ENV CONFIG_EDGE_BUILD=
ENV MSSQL_PID=developer
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install Microsoft SQL Server dependencies
RUN apt-get update && \
    apt-get install -y curl apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-server

# Set labels
LABEL com.microsoft.product="Microsoft SQL Server"
LABEL com.microsoft.version="16.0.4135.4"
LABEL org.opencontainers.image.ref.name="ubuntu"
LABEL org.opencontainers.image.version="22.04"
LABEL vendor="Microsoft"

# Expose the default SQL Server port
EXPOSE 1433

# Set hostname and user for SQL Server
RUN echo "d5d110e51d78" > /etc/hostname
USER mssql

# Start SQL Server
CMD ["/opt/mssql/bin/sqlservr"]
