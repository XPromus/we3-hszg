describe('Todo Creation Spec', () => {
  it("Create User", () => {
    cy.visit("http://localhost:5173/users");
    cy.get('[name="new-username"]').type("New User");
    cy.get('[type="submit"]').click();
  });
  it("Create Todo", () => {
    cy.visit("http://localhost:5173");
    cy.get('[id="todoNameInput"]').type("Test Todo Name");
    cy.get('[id="descriptionInput"]').type("Test Todo Description");
    cy.get('[type="date"]').type('{upArrow}');
    cy.get('[name="user-selection"]').select(0);
    cy.get('[type="submit"]').click();
  });
});
