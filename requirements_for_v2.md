### Requirements

1. Users will be able to create multiple playlists instead of just one
2. Users will have different account types (e.g. "free", "standard", and "premium")

To satisfy the first requirement, we will change the relationship between `user` and `playlist` to a one-to-many relationship. Nothing needs to change in the database as it already supports this change.

To satisfy the second requirement, we can create an account type table for each type and have a one-to-many relationship between it and `user`. To do this we just need to add the account type's foreign key in `user`.
