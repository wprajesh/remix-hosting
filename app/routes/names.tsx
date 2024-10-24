import { ActionFunction, LoaderFunction, json } from "@remix-run/node";
import { useLoaderData } from "@remix-run/react";
import { prisma } from "~/db.server";

// Loader to fetch the names
export const loader: LoaderFunction = async () => {
  const names = await prisma.name.findMany({
    orderBy: { createdAt: "desc" },
  });
  return json({ names });
};

// Action to handle the POST request
export const action: ActionFunction = async ({ request }) => {
  const formData = await request.formData();
  const name = formData.get("name");

  if (typeof name !== "string" || name.trim() === "") {
    return json({ error: "Name is required" }, { status: 400 });
  }

  await prisma.name.create({
    data: { name },
  });

  return json({ success: true });
};

// React component to render the form and list of names
export default function Names() {
  const { names } = useLoaderData();

  return (
    <div>
      <h1>Names List</h1>

      <form method="post">
        <input type="text" name="name" placeholder="Enter your name" />
        <button type="submit">Submit</button>
      </form>

      <ul>
        {names.map((name) => (
          <li key={name.id}>{name.name}</li>
        ))}
      </ul>
    </div>
  );
}
