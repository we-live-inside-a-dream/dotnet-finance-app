# Use the official Microsoft SQL Server 2022 image
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set environment variables required by SQL Server
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Modernwarfare2

# Expose the default SQL Server port
EXPOSE 1433

# Start SQL Server
CMD ["/opt/mssql/bin/sqlservr"]
