Deploying this project to Vercel (static site) — quick guide

What I added
- `vercel.json` — configuration enabling clean URLs (no `.html`) and a fallback to `index.html` for client-side routing.

Notes about behavior
- `cleanUrls: true` removes `.html` from URLs (so `/about.html` becomes `/about`).
- The rewrite rule forwards requests that don't look like asset requests (no dot in path) to `/index.html`, which makes single-page-app style routing work (no `#` needed).

Limitations
- The rewrite rule is intended for SPAs where the client code reads `location.pathname` and renders content accordingly. If you have multiple independent static pages (e.g., `about.html`, `programs.html`) and do NOT use a client-side router, prefer the folder-based approach (move `about.html` → `about/index.html`) instead.

Steps to deploy to Vercel
1. Create a Vercel account at https://vercel.com and log in.
2. In Vercel dashboard click "New Project" → "Import Git Repository" and choose this repository (or connect Git provider and select the repo).
3. For "Framework Preset" choose "Other" (or "Static Site").
4. Set the Output Directory to the repository root (leave empty or set to `.`) because this is a static HTML site.
5. Click Deploy. Vercel will build and publish your site.

Add a custom domain
1. In the project settings go to the "Domains" tab and click "Add".
2. Enter your domain (e.g. `example.com`). Vercel will show DNS instructions.
   - For apex domains (example.com) Vercel typically gives A records to add to your DNS provider.
   - For subdomains (www.example.com) it will usually suggest a CNAME to `cname.vercel-dns.com`.
3. Add the recommended DNS records at your domain registrar or DNS host and wait for propagation (can take minutes to hours).
4. Once Vercel verifies the DNS, HTTPS will be provisioned automatically.

If you want pretty folder-based URLs instead
- Convert files like `about.html` → `about/index.html` to expose `https://yoursite.com/about/` without server rewrites.
- I can do this conversion and update internal links for you automatically if you want.

If you want client-side routing (no `#`) but want Vercel to fallback correctly
- Keep `vercel.json` as added.
- Implement a small client router using the History API (pushState/popstate) to render pages based on `location.pathname`.

Security and HTTPS
- Vercel provisions HTTPS automatically once DNS is verified. No extra steps needed.

Want me to do this for you?
- I cannot connect to your Vercel account or change DNS for you, but I can:
  - Convert your HTML files to folder/index.html layout across the repo and update links (Option A).
  - Add a small client-side router (Option B) and example links that use pushState.
  - Create a simple GitHub Actions workflow that automatically deploys to Vercel when you push (requires a Vercel token).

Tell me which next step you'd like:
- "Convert files to folders" (I will move files and update links),
- "Add client router" (I will add a minimal router and demo), or
- "Add deployment docs + GitHub Actions" (I will add a workflow template and instructions for adding a Vercel token).