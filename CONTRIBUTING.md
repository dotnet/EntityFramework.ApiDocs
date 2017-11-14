# Contributing

This repository only contains infrastructure and metadata for building the Entity Framework Core API reference documentation.

The API reference documentation is generated based on the XML documentation comments associated with each API in the product code:

``` csharp
/// <summary>
///     Override this method to further configure the model that was discovered by convention from the entity types
///     exposed in <see cref="DbSet{TEntity}" /> properties on your derived context. The resulting model may be cached
///     and re-used for subsequent instances of your derived context.
/// </summary>
/// <remarks>
///     If a model is explicitly set on the options for this context (via <see cref="DbContextOptionsBuilder.UseModel(IModel)" />)
///     then this method will not be run.
/// </remarks>
/// <param name="modelBuilder">
///     The builder being used to construct the model for this context. Databases (and other extensions) typically
///     define extension methods on this object that allow you to configure aspects of the model that are specific
///     to a given database.
/// </param>
protected internal virtual void OnModelCreating(ModelBuilder modelBuilder)
```

Improvements to API documentation can be proposed by submitting issues or pull requests on [the product repository](https://github.com/aspnet/EntityFrameworkCore).

General information on contributing to all our repositories is contained in our [Contributing Guide](https://github.com/aspnet/Home/blob/dev/CONTRIBUTING.md).
